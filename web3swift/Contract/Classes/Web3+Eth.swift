//
//  Web3+Eth.swift
//  web3swift
//
//  Created by Alexander Vlasov on 22.12.2017.
//  Copyright © 2017 Bankex Foundation. All rights reserved.
//

import Foundation
import BigInt

extension web3.Eth {
    public func getTransactionCount(address: EthereumAddress, onBlock: String = "latest") -> BigUInt? {
            guard address.isValid else {return nil}
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.getTransactionCount
            let params = [address.address.lowercased(), onBlock] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultString = res["result"] as? String else {return nil}
            let responseData = Data(Array<UInt8>(hex: resultString.lowercased().stripHexPrefix()))
            guard responseData != Data() else {return nil}
            let biguint = BigUInt(responseData)
            return biguint
    }
    
    public func getBalance(address: EthereumAddress, onBlock: String = "latest") -> BigUInt? {
            guard address.isValid else {return nil}
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.getBalance
            let params = [address.address.lowercased(), onBlock] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultString = res["result"] as? String else {return nil}
            let responseData = Data(Array<UInt8>(hex: resultString.lowercased().stripHexPrefix()))
            guard responseData != Data() else {return nil}
            let biguint = BigUInt(responseData)
            return biguint
    }
    
    public func getBlockNumber() -> BigUInt? {
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.blockNumber
            let params = [] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultString = res["result"] as? String else {return nil}
            let responseData = Data(Array<UInt8>(hex: resultString.lowercased().stripHexPrefix()))
            guard responseData != Data() else {return nil}
            let biguint = BigUInt(responseData)
            return biguint
    }
    
    public func getGasPrice() -> BigUInt? {
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.gasPrice
            let params = [] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultString = res["result"] as? String else {return nil}
            let responseData = Data(Array<UInt8>(hex: resultString.lowercased().stripHexPrefix()))
            guard responseData != Data() else {return nil}
            let biguint = BigUInt(responseData)
            return biguint
    }
    
    public func getTransactionDetails(_ txhash: String) -> TransactionDetails? {
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.getTransactionByHash
            let params = [txhash] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultJSON = res["result"] as? [String: Any] else {return nil}
            let details = TransactionDetails(resultJSON)
            return details
    }
    
    public func getTransactionReceipt(_ txhash: String) -> TransactionReceipt? {
            var request = JSONRPCrequest()
            request.method = JSONRPCmethod.getTransactionReceipt
            let params = [txhash] as Array<Encodable>
            let pars = JSONRPCparams(params: params)
            request.params = pars
            let response = self.provider.sendSync(request: request)
            if response == nil {
                return nil
            }
            guard let res = response else {return nil}
            if let error = res["error"] as? String {
                print(error as String)
                return nil
            }
            guard let resultJSON = res["result"] as? [String: Any] else {return nil}
            let details = TransactionReceipt(resultJSON)
            return details
    }
}
