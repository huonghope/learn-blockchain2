hiểu một cách đơn giản, toàn bộ các hoạt động chuyển tiền, nhận tiền, sinh contract, tạo token.... trên mạng ethereum đều là transaction. Những transaction này sẽ được ghi lại vào trong các block và tồn tại mãi mãi không ai thay đổi được.

nonce: đây chính là số transaction mà tài khoản gửi đã từng thực hiện. Mỗi lần gửi một transaction thì giá trị này sẽ tăng lên. Số nonce sinnhằm ngăn các cuộc tấn công replay attack trong ethereum.
gasPrice: Mạng lưới ethereum được vận hành bởi gas, cũng giống như xăng để chạy xe vậy. Mỗi transaction đều tốn một lượng gas nhất định, và gasPrice chính là đơn giá của 1 gas, đơn giá này tính bằng chính ether, tuy nhiên giá trị của nó khá nhỏ, chỉ từ 0.1 cho tới 100+ Gwei mà thôi.
gasLimit: Đây là số lượng gas tối đa mà người gửi có thể trả cho một transaction. Nếu coi một transaction là một chiếc xe máy, thì gas chính là xăng, gasPrice chính là giá xăng, còn gasLimit chính là dung tích bình xăng.
to: địa chỉ gửi tới của transaction, nó chính là địa chỉ của contract Voting.
value: số lượng ether mà người gửi muốn chuyển.
data: phần này khá phức tạp, về cơ bản nó sẽ được tạo ra từ 2 phần
 + function signature: ethereum sử dụng 4 bytes đầu tiên trong mã hóa sha3 của function name để làm function signature, trong trường hợp này là 0xcc9ab267
 + function arguments: tham số trong hàm của ta là Nick, mã hóa bytes32 của giá trị này là

 #document LinK: https://viblo.asia/p/mot-transaction-trong-ethereum-duoc-xay-ra-nhu-the-nao-maGK7mYDlj2

* Ký transaction
Bạn có thể để ý bên trên, transaction được gọi từ tài khoản web3.eth.accounts[0].

Trong mạng ethereum, để chứng minh transaction đó thuộc về mình, chúng ta sẽ phải ký giao dịch. Việc này được thực hiện với private key: