# --------------------------------------------------
# Owned
# --------------------------------------------------

event OwnerUpdated:
    user: indexed(address)
    newOwner: indexed(address)

owner: public(address)

@external
def setOwner(newOwner: address):

    assert msg.sender == self.owner, "UNAUTHORIZED"

    self.owner = newOwner

    log OwnerUpdated(msg.sender, newOwner)

# --------------------------------------------------
# Counter
# --------------------------------------------------

event CountUpdated:
    count: uint256

count: public(uint256)

@internal
def _setCount(_count: uint256):

    self.count = _count

    log CountUpdated(_count)

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