from solcx import compile_standard
import json
import os
from dotenv import load_dotenv
from web3 import Web3

load_dotenv()

#solcx.install_solc('0.7.0')
# read file 
with open("./SimpleStorage.sol", "r") as file: 
  simple_storage_file = file.read()
  print("File read successfully")

# read and compile file
compiled_sol = compile_standard(
  {
    "language": "Solidity",
    "sources": { "SimpleStorage.sol": {"content": simple_storage_file }},
    "settings": {
      "outputSelection": {
        "*":{"*": ["abi", "metadata", "evm.bytecode", "evm.sourceMap"]}
      }
    }
  },
  solc_version="0.7.0"
)

#compile file
with open("compiled_code.json", "w") as file:
  json.dump(compiled_sol, file)
bytecode = compiled_sol["contracts"]["SimpleStorage.sol"]["SimpleStorage"]["evm"]["bytecode"]["object"]

# get api 
abi = compiled_sol["contracts"]["SimpleStorage.sol"]["SimpleStorage"]["abi"]
#print(abi)

#for connecting to ganache
w3 = Web3(Web3.HTTPProvider("HTTP://127.0.0.1:7545"))

#networkd id
chain_id = 1337
my_address = "0x2083f077a4a6Bd86C00b096C4109e86D779CAD85"
private_key = os.getenv("PRIVATE_KEY")

#Create the contract in python
SimpleStorage = w3.eth.contract(abi=abi, bytecode=bytecode)
#print(SimpleStorage)

#get latestest transaction
#Index cua 1 transaction hoan chinh, se tang dan theo moi lan tracsaction duoc tao
nonce = w3.eth.getTransactionCount(my_address)
#print(nonce)

# Qua trinh tao xac nhan va build 1 he thong blockchain tai local
# 1. Build a transaction
# 2. Sign a transaction
# 3. Send a transaction
transaction = SimpleStorage.constructor().buildTransaction({"chainId": chain_id, "from": my_address, "nonce": nonce})
#print(transaction)

sign_txn = w3.eth.account.sign_transaction(transaction, private_key=private_key)
#print(sign_txn)

# Send this signed transcaction (Gui xac nhan)
print("Deloying contract")
tx_hash = w3.eth.send_raw_transaction(sign_txn.rawTransaction)

# Receive something -- this address of contract va 1 so thong tin
tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
print("Deployed")
# Working the contract, you alwats need
# Contract Addrss
# Contract ABI
# => Sau khi da ky trasaction xong roi thi lien ket den contract thong qua dia chi va abi
simple_storage = w3.eth.contract(address=tx_receipt.contractAddress, abi=abi)
# Call -> Simulate making the call and getting a return
# Transact -> Acctually make a state change
print(simple_storage.functions.store(17).call()) # return farivoteNumber Se khong co hieu luc -> Phai tao 1 transaction // se khong contract nao duoc tao ra 
print(simple_storage.functions.retrieve().call()) #check ini value

print("Updating Contract....")
#Tao 1 transaction cho fuction store
store_transaction = simple_storage.functions.store(15).buildTransaction({
  "chainId": chain_id,
  "from": my_address,
  "nonce": nonce + 1,
})

#sign
signed_store_txn = w3.eth.account.sign_transaction(store_transaction, private_key=private_key)

#send
send_store_tx = w3.eth.send_raw_transaction(signed_store_txn.rawTransaction)
tx_receipt_store = w3.eth.wait_for_transaction_receipt(send_store_tx) # nhan lai dia chi 
print("Updated")
print(simple_storage.functions.retrieve().call())