# Mobbex Recurring Billing

Mobbex gateway for manage recurring billing.

## _Instalation_

```
gem install mobbex_recurring
```

## _Initilization_

First you need to set up your credentials:

```
Mobbex::Gateway.configure do |config|

  config.x_api_key = "zJ8LFTBX6Ba8D611e9io13fDZAwj0QmKO1Hn1yIj'
  config.x_access_token = 'd31f0721-2f85-44e7-bcc6-15e19d1a53cc'

end
```

## _Usage_

All methods returns a object with the next filds:

| method | description                                            |
| ------ | ------------------------------------------------------ |
| result | Result of the request (true \| false)                  |
| data   | Data returned by the broker. Only when result is true. |
| error  | Error description provided when the result is false    |

The data object, when exists, contains an array with de data provided by the company. See the oficial page for more information.

The data provided in the sample code is for reference only.

### Get the first 15 subscriptions

```
response = Mobbex::Gateway.new.get_subscriptions
```

if response.result is true result.data contains an array of subscriptions objects.


### Get a subcription

Get the data of a subscription identified by the parameter **subscription-id**.

```
response = Mobbex::Gateway.new.get_subscription('subscription-id')
```

If the response.result is true, response.data contains an object with the subscription data.

### Create a subscription

Create a new *subscription* and initialize it with the data provided as parameter.

```
    data = {
      "total" => 100,
      "setupFee" => 0,
      "currency" => "ARS",
      "type" => "dynamic",
      "name" => "Suscripción Demo",
      "description" => "Mobbex.dev",
      "interval" => "1m",
      "trial" => 0,
      "test" => false,
      "limit" => 0,
      "return_url" => "https://mobbex.com",
      "reference" => "subscription_0001",
      "features" => ["accept_no_funds"],
      "options" => {
                    "theme" => {
                                "type" => "dark"
                               }
                   }
    }

    response = Mobbex::Gateway.new.create_subscription(data)
```

If response.result is true, response.data contains an object with the *subscription* data.

### Edit a subscription

Modify an existing *subscription* identified by the parameter **subscription-id** with the data provided.

```
    data = {
      "total" => 100,
      "setupFee" => 0,
      "currency" => "ARS",
      "type" => "dynamic",
      "name" => "Suscripción Demo",
      "description" => "Mobbex.dev",
      "interval" => "1m",
      "trial" => 0,
      "test" => false,
      "limit" => 0,
      "return_url" => "https://mobbex.com",
      "reference" => "subscription_0001",
      "features" => ["accept_no_funds"],
      "options" => {
                    "theme" => {
                                "type" => "dark"
                               }
                   }
    }

    response = Mobbex::Gateway.new.edit_subscription('subscription_id', data)
```

If response.result is true, response.data contains an object with the *subscription* data.

### Activate subscription

Activate an existing *subscription*.

```
response = Mobbex::Gateway.new.activate_subscription('subscription_id')
```

If response.result is true the subscription is active.

### Inactive subscription

Inactivate a *subscription*.

```
response = Mobbex::Gateway.new.deactivate_subscription('subscription-id')
```

If response.result is true, the subscription is inactive.

### Get the subscribers asociated to a subscription

Get the list of *subscribers* associated to the *subscription* passed as parameter.

```
response = Mobbex::Gateway.new.get_subscribers('subcription-id')
```

If response.result is true, the response.data contains an array of the *subscribers* objects.

### Create a subscriber

Create a new _subscriber_ with the provided data and associate it with the _subscription_ passed as parameter.

```
data = {"customer" => {
                       "email" => "demo@mobbex.com",
                       "identification" => "12123123",
                       "name" => "Test Mobbex"
                       },
        "startDate" => {
                        "day" => 27,
                        "month" => 3,
                        "year" => 2021
                       },
        "reference" => "233211212"
       }

response = Mobbex::Gateway.new.create_subscriber('subscription-id', data)
```

if response.result is true then response.data contains the data of the *subscriber*.

### Edit subcriber

Modify the data of the *subscriber* passed as parameter.

```
data = {"customerData" => {
                           "name" => "Cliente Demo",
                           "phone" => "112233445"
                          }
       }

response = Mobbex::Gateway.new.edit_subscriber('subscription-id', 'subscriber-id', data)
```
If response.result is true then the *subscriber* was modified.

### Get subcriber

Get a *subscriber* associated with a *subscription*.

```
response = Mobbex::Gateway.new.get_subscriber('subscription-id', 'subscriber-id')
```

If response.result is true then response.data contains an object containing the all the information of the *subscriber*.

### Activate subscriber

It allows to re-activate the charges to a particular *subscriber*.

```
response = Mobbex::Gateway.new.activate_subscriber('subscription-id', 'subscriber-id')
```

If success the response.result is set to true.

### Suspend subcriber

It allows to suspend the charges that are made to a particular *subscriber*.

```
response = Mobbex::Gateway.new.suspend_subscriber('subscription-id', 'subscriber-id')
```

If success the response.result is set to true.

### Move subscriber

Move a subscriber from a subscription to another.

```
data = {"sid" => "destination-subscription-id"}

response = Mobbex::Gateway.new.move_subscriber('current-subscription-id', 'subscriber-id', data)
```
If success the response.result is set to true.

## _Maintainer_

Daniel Seren (francisco.d.seren@gmail.com)

## _License_

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
