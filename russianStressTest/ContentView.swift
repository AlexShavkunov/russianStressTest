import SwiftUI

struct ContentView: View {
    @State private var inputText: String = "" // Переменная для текста из EditText
    @State private var outputText: String = "" // Переменная для обработанного текста

    var body: some View {
        VStack {
            // EditText для ввода текста
            TextField("Введите текст...", text: $inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .multilineTextAlignment(.center)

            // Кнопка для обработки текста
            Button(action: {
                outputText = getStress(text: inputText)
            }) {
                Text("Обработать текст")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // TextView для отображения обработанного текста
            Text(outputText)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .padding()

            Spacer() // Добавляем отступ внизу для эстетики
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
