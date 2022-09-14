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

