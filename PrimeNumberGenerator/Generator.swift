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
            N = (2 ** (t - 1) / q) + BInt((pow(2, t - 1) * e / q).rounded())
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
            if modpow(base: 2, exp: p - 1, n: p) == 1 && modpow(base: 2, exp: N + u, n: p) != 1 {
                self.answer = p
            } else {
                u += 2
                goto(.stepThree)
            }
        }
    }
    
    private func modpow(base: BInt, exp: BInt, n: BInt) -> BInt {
        if n == 1 { return 0 }

        var ret: BInt = 1
        var tempBase = base
        var tempExp = exp
          
        tempBase = tempBase % n;
          
        while tempExp > 0 {
          
          if (tempExp % 2) == 1 {
            ret = (ret * tempBase) % n;
          }
          
          tempExp >>= 1;
          
          tempBase = (tempBase * tempBase) % n;
        }
          
        return ret
      }
}

enum Steps {
    case stepOne
    case stepTwo
    case stepThree
    case stepFour
    case stepFive
}
