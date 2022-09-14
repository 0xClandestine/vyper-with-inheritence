# vyper-with-inheritence

Dependecies
- vyper cli
- pip install `repex`
- pip install `argparse`

Flatten contract (add inherited contract so we can compile)
```
python vyplus.py FILE_TO_FLATTEN FILE_TO_FLATTEN_TO
```

Example contract that inherits `Owned` and `Counter`

```vy
# --------------------------------------------------
# Owned Counter
# --------------------------------------------------

# import ./src/modules/Owned.vy
# import ./src/modules/Counter.vy

@internal
def __init__(newOwner: address):
    self.owner = newOwner

    log OwnerUpdated(ZERO_ADDRESS, newOwner)

@external
def setCount(newCount: uint256):
    
    assert msg.sender == self.owner, "YOU ARE NOT THE OWNER!"
    
    self._setCount(newCount)`
```
