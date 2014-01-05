# Additional Mail Header Attribute

To uniquely identify a E-Mail send by the Rails Application I prefer add attribute to the Mail header.
The unique value is generated via `uuidgen`.

## Installation

* generate `uuidgen` copy to `app/mailders/*_mailer.rb`
* oneliner `echo "headers['X-Template-Id'] = \"$(uuidgen)\"" | pbcopy`

## Usage

```ruby
# e.g. app/mailers/order_mailer.rb
class OrderMailer < ActionMailer::Base

  def order_confirmation(order)
    @order = order

    headers['X-Template-Id'] = "7B098959-BDFF-4E18-86AB-5AEA9F4A0C68"
    mail to: order.email, subject: "Mail Subject"
  end
end
```


```ruby
# e.g. spec/mailers/order_mailer_spec.rb
require "spec_helper"

describe OrderMailer do

  describe :order_confirmation do

    before do
      @order = FactoryGirl.create(:order)
    end

    let(:mail) { OrderMailer.order_confirmation(@order) }

    context "mail headers" do
      it { expect(mail.content_type).to eq "text/plain; charset=UTF-8" }
      it { expect(mail.header['X-Template-Id'].to_s).to eq "7B098959-BDFF-4E18-86AB-5AEA9F4A0C68" }
    end

  end
end
```
