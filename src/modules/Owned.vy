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

