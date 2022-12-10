import BigNumber

class Generator {
    var t: BInt = 0
    var q: BInt = 0
    var N: BInt = 0
    var p: BInt = 0
    var u: BInt = 0
    var answer: BInt = 0
    
    init(t: BInt, q: BInt) {
        self.t = t
        self.q = q
    }

    func goto(_ step: Steps) {
        switch step {
        case .stepOne:
            let e = Double.random(in: 0...1)
            N = (2 ** (t - 1) / q) + BInt((BDouble((2 ** (t - 1)).description)! * e / q).rounded())
            if N % 2 == 1 {
                N += 1
            }
            goto(.stepTwo)
            
        case .stepTwo:
            u = 0
            goto(.stepThree)
            
        case .stepThree:
            p = q * (N + u) + 1
            goto(.stepFour)
            
        case .stepFour:
            if p > (2 ** t) {
                goto(.stepOne)
            } else {
                goto(.stepFive)
            }
            
        case .stepFive:
            if ((2 ** (p - 1)) % p == 1) && ((2 ** (N + u)) % p != 1) {
                self.answer = p
            } else {
                u += 2
                goto(.stepThree)
            }
        }
    }
}

enum Steps {
    case stepOne
    case stepTwo
    case stepThree
    case stepFour
    case stepFive
}
