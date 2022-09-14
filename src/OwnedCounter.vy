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
    
    self._setCount(newCount)