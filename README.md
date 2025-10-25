# Eco Locator

O **Eco Locator** é um aplicativo Flutter desenvolvido para ajudar usuários a encontrar pontos de reciclagem próximos (plástico, vidro, papel, eletrônicos etc.) com base em sua localização atual.  
Utiliza mapas gratuitos do **OpenStreetMap**, permitindo interação em tempo real e cálculo da distância entre o usuário e os pontos cadastrados.

---

## 🧩 Funcionalidades Principais

- Localização atual do usuário (com permissão de GPS)  
- Mapa interativo via **OpenStreetMap**  
- Marcadores personalizados para pontos de reciclagem  
- Exibição de informações: nome, tipo de material e distância  
- Filtro por tipo de reciclagem (plástico, vidro, papel, eletrônicos etc.)  
- Tema claro e escuro dinâmico  

---

## ⚙️ Stack Técnica

| Componente | Tecnologia Utilizada |
|-------------|----------------------|
| Linguagem | Dart / Flutter 3.32.1 |
| Gerenciamento de Estado | Provider |
| Mapas | OpenStreetMap (via `flutter_map`) |
| Cálculo de Distância | Fórmula de Haversine |
| Fonte de Dados | Arquivo JSON local |
| Tema | Claro/Escuro dinâmico |
| Arquitetura | Clean Architecture (domain / data / presentation) |
| Testes | Unitários para cálculo de distância |
| Ambiente Java | Java 11 |

---

## 🗂️ Estrutura do Projeto

```text
lib/
├── core/
│   ├── enum/
│   ├── utils/
│   └── theme/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── providers/
│   ├── pages/
│   └── widgets/
└── main.dart

# **Clone o repositório**
git clone https://github.com/seu-usuario/ecolocator.git

# Acesse a pasta do projeto
cd ecolocator

# Instale as dependências
flutter pub get

# Execute o aplicativo
flutter run

💡 Diferenciais Técnicos

Clean Architecture
Tema dinâmico (claro/escuro)
Uso eficiente de geolocalização e mapas abertos
Interface leve e intuitiva
