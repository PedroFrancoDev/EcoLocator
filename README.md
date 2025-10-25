# Eco Locator

O **Eco Locator** é um aplicativo Flutter desenvolvido para ajudar usuários a encontrar pontos de reciclagem próximos (plástico, vidro, papel, eletrônicos etc.) com base em sua localização atual.  
Utiliza mapas gratuitos do **OpenStreetMap**, permitindo interação em tempo real e cálculo da distância entre o usuário e os pontos cadastrados.

---

## Funcionalidades Principais

- Obtenção da localização atual do usuário (com permissão de GPS)  
- Exibição de mapa interativo via OpenStreetMap  
- Marcadores personalizados para pontos de reciclagem  
- Exibição de informações do ponto: nome, tipo de material e distância até o local  
- Filtro por tipo de reciclagem (plástico, vidro, papel, eletrônicos etc.)  
- Tema claro e escuro dinâmico  

---

## Stack Técnica

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

# Estrutura do Projeto

```text
lib/
├── core/
│   ├── constants/
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
---
Para rodar os testes:

```bash
flutter test
Instalação e Execução
Clone o repositório:

bash
Copiar código
git clone https://github.com/seu-usuario/ecolocator.git
Acesse a pasta do projeto:

bash
Copiar código
cd ecolocator
Instale as dependências:

bash
Copiar código
flutter pub get
Execute o aplicativo:

bash
Copiar código
flutter run
Build do APK
Para gerar o APK de instalação no Android:

bash
Copiar código
flutter build apk --release
O arquivo gerado estará em:

swift
Copiar código
build/app/outputs/flutter-apk/app-release.apk
Diferenciais Técnicos
Clean Architecture

Testes unitários

Tema dinâmico (claro/escuro)

Uso eficiente de geolocalização e mapas abertos

Interface leve e intuitiva

Desenvolvido por
Pedro Franco
Flutter Developer | Web & Mobile
LinkedIn • GitHub






