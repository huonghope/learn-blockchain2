from brownie import SimpleStorage, accounts


# first true
def test_deploy():
  account = accounts[0]
  simple_storage = SimpleStorage.deploy({"from": account})
  starting_value = simple_storage.retrieve()
  expected = 0

  # assert
  assert expected == starting_value

# Khi sai chay brownie test --pdb de vao consolog va xuat ra ket qua
# Chay kiem tra cac bien o terminal
def test_update_stogare():
  # arrange
  account = accounts[0]
  print(account)
  # simple from account 0
  simple_storage = SimpleStorage.deploy({"from": account})

  #Act
  expected = 15
  simple_storage.store(expected,  {"from": account })

  assert 5 == simple_storage.retrieve()
def main():
  test_deploy()