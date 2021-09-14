from brownie import accounts, config, SimpleStorage

# get account listb
# get selected account
# load account by config file - yaml
def deploy_simple_storage():
    #account = accounts.load("brownie-test")
    # account = accounts.add(os.getenv("PRIVATE_KEY"))
    #account = accounts.add(config["wallets"]["from_key"])
    #print(account)
    account = accounts[0]
    #deloy from account 1
    simple_storage = SimpleStorage.deploy({"from": account})
    #Transts
    # get init value
    stored_value = simple_storage.retrieve()
    print(stored_value)
    # set value from account 0
    transaction = simple_storage.store(15, {"from": account})
    transaction.wait(1)
    # get value from contracts
    updated_stored_value = simple_storage.retrieve()
    print(updated_stored_value)

def main():
    deploy_simple_storage()