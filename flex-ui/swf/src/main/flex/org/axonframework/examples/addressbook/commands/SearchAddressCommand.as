/*
 * Copyright (c) 2010. Axon Framework
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.axonframework.examples.addressbook.commands {
import mx.collections.ArrayCollection;
import mx.rpc.AsyncToken;

import org.axonframework.examples.addressbook.messages.SearchForAddressesMessage;
import org.axonframework.examples.addressbook.model.AddressModel;

/**
 * Query command that executes a call to the backend to query all addresses and present them using the addressModel
 */
public class SearchAddressCommand extends BaseCommand {

    [Inject]
    public var addressModel:AddressModel;

    public function SearchAddressCommand() {
        super();
    }

    public function execute(message:SearchForAddressesMessage):AsyncToken {
        return addressService.searchAddresses(message.address);
    }

    public function result(addresses:ArrayCollection):void {
        addressModel.addresses = addresses;
    }

}
}