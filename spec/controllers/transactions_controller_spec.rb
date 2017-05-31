require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_template :index }
  end
end
