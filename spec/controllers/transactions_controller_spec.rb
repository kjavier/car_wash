require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_template :index }
  end

  describe 'GET #step1' do
    before { get :step1 }

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_template :step1 }
  end

  describe 'GET #step2' do
    before { get :step2 }

    it { is_expected.to respond_with :ok }
    it { is_expected.to respond_with_content_type :html }
    it { is_expected.to render_template :step2 }
  end
end
