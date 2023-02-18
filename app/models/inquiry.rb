class Inquiry < ApplicationRecord

  belongs_to :customer

  enum content: { account_recovery: 0, delete_account: 1, how_to: 2, other: 3 }

end
