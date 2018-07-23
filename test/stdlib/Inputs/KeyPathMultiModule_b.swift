public struct A {
  public var x: Int { return 0 }

  // NB: These declarations intentionally do not constrain the index type
  // to be Hashable, to ensure that we get the Hashable conformance from
  // the context where the key path was formed for equality while using the
  // property descriptor's accessors.
  public subscript<T>(withGeneric index: T) -> T {
    return index
  }
  public private(set) subscript<T>(withGenericPrivateSet index: T) -> T {
    get {
      return index
    }
    set { }
  }
  public subscript<T>(withGenericSettable index: T) -> T {
    get {
      return index
    }
    set { }
  }

  public var storedA: B<Int>
  public private(set) var storedB: Double

  public var y: Int {
    get { return 0 }
    set { }
  }

  public private(set) var z: Int {
    get { return 0 }
    set { }
  }
}

public struct B<U> {
  public var x: Int { return 0 }
  public var y: Int {
    get { return 0 }
    set { }
  }
  public private(set) var z: Int {
    get { return 0 }
    set { }
  }

  public subscript(withInt i: Int) -> Int {
    return i
  }

  // NB: These declarations intentionally do not constrain the index type
  // to be Hashable, to ensure that we get the Hashable conformance from
  // the context where the key path was formed for equality while using the
  // property descriptor's accessors.
  public subscript<T>(withGeneric i: T) -> T {
    return i
  }
  public private(set) subscript<T>(withGenericPrivateSet index: T) -> T {
    get {
      return index
    }
    set { }
  }
  public subscript<T>(withGenericSettable index: T) -> T {
    get {
      return index
    }
    set { }
  }

  public var storedA: U
  public internal(set) var storedB: U
}

public func A_x_keypath() -> KeyPath<A, Int> {
  return \A.x
}

public func A_y_keypath() -> KeyPath<A, Int> {
  return \A.y
}

public func A_z_keypath() -> KeyPath<A, Int> {
  return \A.z
}

public func A_subscript_withGeneric_keypath<T: Hashable>(index: T)
    -> KeyPath<A, T> {
  return \A.[withGeneric: index]
}

public func A_subscript_withGeneric_butt_keypath()
    -> KeyPath<A, String> {
  return \A.[withGeneric: "pomeranian's big butt"]
}

public func B_subscript_withInt_keypath<T>(_: T.Type, index: Int)
    -> KeyPath<B<T>, Int> {
  return \B<T>.[withInt: index]
}

public func B_Double_subscript_withInt_0_keypath()
    -> KeyPath<B<Double>, Int> {
  return \B<Double>.[withInt: 0]
}

public func B_subscript_withGeneric_keypath<T, U: Hashable>(
  _: T.Type, index: U
) -> KeyPath<B<T>, U> {
  return \B<T>.[withGeneric: index]
}

public func B_Double_subscript_withGeneric_butt_keypath()
    -> KeyPath<B<Double>, String> {
  return \B<Double>.[withGeneric: "Never is the universal butt type"]
}

public func A_storedA_keypath() -> KeyPath<A, B<Int>> {
  return \A.storedA
}

public func A_storedA_storedB_keypath() -> KeyPath<A, Int> {
  return \A.storedA.storedB
}

public func A_storedB_keypath() -> KeyPath<A, Double> {
  return \A.storedB
}

public func B_x_keypath<T>(_: T.Type) -> KeyPath<B<T>, Int> {
  return \B<T>.x
}

public func B_y_keypath<T>(_: T.Type) -> KeyPath<B<T>, Int> {
  return \B<T>.y
}

public func B_z_keypath<T>(_: T.Type) -> KeyPath<B<T>, Int> {
  return \B<T>.z
}

public func B_Int_x_keypath() -> KeyPath<B<Int>, Int> {
  return \B<Int>.x
}

public func B_Int_y_keypath() -> KeyPath<B<Int>, Int> {
  return \B<Int>.y
}

public func B_Int_z_keypath() -> KeyPath<B<Int>, Int> {
  return \B<Int>.z
}

public func B_storedA_keypath<T>(_: T.Type) -> KeyPath<B<T>, T> {
  return \B<T>.storedA
}

public func B_storedB_keypath<T>(_: T.Type) -> KeyPath<B<T>, T> {
  return \B<T>.storedB
}

public func B_Int_storedA_keypath() -> KeyPath<B<Int>, Int> {
  return \B<Int>.storedA
}

public func B_Int_storedB_keypath() -> KeyPath<B<Int>, Int> {
  return \B<Int>.storedB
}
