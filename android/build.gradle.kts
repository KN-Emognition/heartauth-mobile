import com.android.build.gradle.LibraryExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}


tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    afterEvaluate {
        // Only touch Android library modules (plugins that fail due to missing namespace)
        plugins.withId("com.android.library") {
            val androidExt = extensions.findByName("android") as? LibraryExtension
            if (androidExt != null && androidExt.namespace == null) {
                val manifest = file("src/main/AndroidManifest.xml")
                if (manifest.exists()) {
                    val text = manifest.readText()
                    val pkg = Regex("""package\s*=\s*["']([^"']+)["']""")
                        .find(text)
                        ?.groupValues?.getOrNull(1)
                        ?.trim()
                    if (!pkg.isNullOrEmpty()) {
                        println("Applying missing namespace '$pkg' to project ${project.name}")
                        androidExt.namespace = pkg
                    }
                }
            }
        }
    }
}