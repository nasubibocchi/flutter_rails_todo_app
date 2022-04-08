require 'rails_helper'

describe ::TodosController, type: :request do
  describe "#GET todos/all" do
    let(:url) { '/todos/all' }
    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end

    subject { get url, headers: headers }

    context "There are todo list to return" do
      before do
        todos_arr = []
        5.times do
          todos_arr << build(:todo)
        end
        ::Todo.import!(todos_arr)
      end

      it 'returns 200' do
        subject
        expect(response.status).to eq 200

        res = JSON.parse(response.body)
        expect(res['todos'].count).to eq 5
      end
    end
  end

  describe "#POST todos" do
    let(:url) { '/todos' }
    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end

    let(:params) {}

    subject { post url, params: params.to_json, headers: headers }

    let(:params) do
      {
        body: 'body',
        is_done: 'is_done',
      }
    end

    it 'creates a record' do
      expect { subject }.to change { ::Todo.count }.by(1)
      # binding.irb
      expect(response.status).to eq 200
    end
  end
end
