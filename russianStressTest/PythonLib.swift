import Foundation
import Python

struct PythonLib {
    
    /// Для установки стороннего пакета pip использовать:
    /// pip3 install --target=ios/lib <package name>
    private static let additionalPaths = [
        "lib",
        "python-stdlib/lib-dynload",
        "russianstress/stressrnn"
    ]

    static func initPython() {
        guard let pythonStdLibPath = getPythonStdLibPath() else {
            print("Error: python-stdlib path is nil.")
            return
        }

        guard let additionalPaths = getAdditionalPaths() else {
            print("Error: One or more additional paths are nil.")
            return
        }

        setEnvironmentVariables(pythonStdLibPath: pythonStdLibPath, additionalPaths: additionalPaths)
        initializePython()
    }

    private static func getPythonStdLibPath() -> String? {
        return Bundle.main.path(forResource: "python-stdlib", ofType: nil)
    }

    private static func getAdditionalPaths() -> [String]? {
        let paths = additionalPaths.compactMap { Bundle.main.path(forResource: $0, ofType: nil) }
        return paths.count == additionalPaths.count ? paths : nil
    }

    private static func setEnvironmentVariables(pythonStdLibPath: String, additionalPaths: [String]) {
        setenv("PYTHONHOME", pythonStdLibPath, 1)
        setenv("PYTHONPATH", ([pythonStdLibPath] + additionalPaths).joined(separator: ":"), 1)
    }

    private static func initializePython() {
        Py_Initialize()
        print("Python ready to use!")
    }
}
