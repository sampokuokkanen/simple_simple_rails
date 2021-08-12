class GreetingsController < ApplicationController
  def index
    @count = Counter.first&.count.to_i
    BelatedHelper.client.perform_belated(
      proc {
        count = Counter.find_or_initialize_by(id: 1)
        count.update(count: count.count.next)
      }
    )
  end
end
