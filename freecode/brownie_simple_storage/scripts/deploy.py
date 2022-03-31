from brownie import accounts, config, SimpleStorage, network

# get account listb
# get selected account
# load account by config file - yaml
def deploy_simple_storage():
    #account = accounts.load("brownie-test")
    # account = accounts.add(os.getenv("PRIVATE_KEY"))
    #account = accounts.add(config["wallets"]["from_key"])
    #print(account)
    #account = accounts[0] #mac dinh neu chay brownie khong network

    account = get_account()
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

def get_account():
    # Them bien moi truong de nhan viet env
    # Neu la dev thi xuat ra account cua Metamask
    # Neu khong thi lay account tren fu
    if(network.show_active() == 'development'):
        return accounts[0]
    else:
        # add account
        return accounts.add(config["wallets"]["from_key"])
def main():
    deploy_simple_storage()