require 'rails_helper'

# LINE | MESSAGE        | ORIGIN   | TYPE    | TEST
# =====|================|==========|=========|===============
# 6    | call           | incoming | query   | assert result
# 7    | Game.with_lock | outgoing | command | expect to send
# 7    | events.<<      | outgoing | command | expect to send

RSpec.describe PickRandomDealer do
end
