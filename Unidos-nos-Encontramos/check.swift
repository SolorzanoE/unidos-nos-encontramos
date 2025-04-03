import SwiftUI

struct Check: View {
    private let api = ApiService()
    
    var body: some View {
        Button("Api") {
            Task {
                do {
                    let data = try await api.consume(
                        body: User(user: "usuario@ejemplo.com", password: "Contraseña123!"),
                        method: .post,
                        endpoint: "http//localhost:8085apogin"
                    )
                    
                            print("Datos recibidos: \(String(data: data, encoding: .utf8) ?? "No se pudo convertir a texto")")
                    
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: data)
                    print(user)
                    
                } catch {
                    print("Error al decodificar JSON: \(error.localizedDescription)")
                }
            }
        }
    }
}

private struct User: Codable {
    let user: String
    let password: String
}

#Preview {
    Check()
}
