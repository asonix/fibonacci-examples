pub struct Fibonacci {
    m_one: u32,
    m_two: u32,
}

impl Fibonacci {
    pub fn new() -> Fibonacci {
        Fibonacci { m_one: 0, m_two: 0 }
    }
}

impl Iterator for Fibonacci {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        let v: u32 = self.m_one;

        self.m_one = if self.m_one > 0 {
            self.m_one + self.m_two
        } else {
            1
        };

        self.m_two = v;

        Some(v)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn it_works() {
        let mut fib = Fibonacci::new();

        assert_eq!(Some(0), fib.next(), "First iteration was not 0");
        assert_eq!(Some(1), fib.next(), "Second iteration was not 1");
        assert_eq!(Some(1), fib.next(), "Third iteration was not 1");
        assert_eq!(Some(2), fib.next(), "Fourth iteration was not 2");
        assert_eq!(Some(3), fib.next(), "Fifth iteration was not 3");
        assert_eq!(Some(5), fib.next(), "Sixth iteration was not 5");
    }

    #[test]
    fn collection() {
        let fib = Fibonacci::new();

        let v: Vec<u32> = fib.take(5).collect();

        assert_eq!(
            vec![0, 1, 1, 2, 3],
            v,
            "First five fibonacci numbers are not [0, 1, 1, 2, 3]"
        );
    }
}
