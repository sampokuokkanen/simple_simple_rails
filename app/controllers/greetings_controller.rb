# frozen_string_literal: true

class GreetingsController < ApplicationController
  def index
    @count = Counter.first&.count.to_i
    BelatedHelper.client.perform_belated(
      proc {
        count = Counter.find_by(id: 1) || Counter.create!
        count.update(count: count.count.next)
      }
    )
  end

  def privacy_policy
  end

  def moo
    render cowsay: params[:moo] || 'Hello from RenderCow'
  end

  RenderCow.characters.each do |character|
    define_method(character) do
      render(character => character.to_s.capitalize)
    end
  end
end
