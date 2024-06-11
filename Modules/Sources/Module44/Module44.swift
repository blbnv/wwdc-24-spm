import Instabug

class Module44 {
    init() {
        Instabug.disableMethodSwizzling()
        Instabug.start(withToken: "d03a7048b2c5d83a1da2e921842a226b", invocationEvents: .shake)
    }
}
