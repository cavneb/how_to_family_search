class HomeController < ApplicationController
  def index
    @nav = 'home'
  end

  def family_search
    @nav = 'guides'
  end

  def ancestry
    @nav = 'guides'
  end

  def find_my_past
    @nav = 'guides'
  end

  def my_heritage
    @nav = 'guides'
  end

  def american_ancestors
    @nav = 'guides'
  end

  def puzzilla
    @nav = 'guides'
  end

  def hope_chest
    @nav = 'guides'
  end

  def find_a_grave
    @nav = 'guides'
  end

  def billion_graves
    @nav = 'guides'
  end
end
