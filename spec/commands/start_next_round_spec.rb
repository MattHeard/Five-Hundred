require 'rails_helper'

# LINE | MESSAGE              | ORIGIN   | TYPE    | TEST
# =====|======================|==========|=========|===============
# 7    | call                 | incoming | query   | assert result
# 9    | CollectAllCards.call | outgoing | command | expect to send
# 9    | DealAllCards.call    | outgoing | command | expect to send
# 9    | ResetBids.call       | outgoing | command | expect to send
# 9    | RotateDealer.call    | outgoing | command | expect to send
# 9    | StartNextTrick.call  | outgoing | command | expect to send

RSpec.describe StartNextRound do
end
