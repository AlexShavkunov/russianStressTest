import Foundation
import PythonKit

func getStress(text: String) -> String {
    let module = Python.import("russian_stresses")
    return String("\(module.get_stress(text))")
}
