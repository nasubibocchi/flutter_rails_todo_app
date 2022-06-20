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

  describe '#PATCH todos/:id' do
    let(:url) { "/todos/#{todo.id}" }
    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end
    let(:todo) { create(:todo) }

    subject { patch url, params: params.to_json, headers: headers }

    context 'with valid params' do
      let(:params) do
        {
          id: todo.id,
          body: 'modified body',
          is_done: true,
        }
      end

      it 'returns correct state' do
        subject
        expect(response.status).to eq 200
      end

      it 'returns correct is_done' do
        subject
        res = JSON.parse(response.body)
        # binding.irb
        expect(res['is_done']).to eq true
      end
    end
  end

  describe '#DELETE todo/:id' do
    let(:url) { "/todos/#{todo_id}" }
    let(:headers) do
      {
        'Content-Type': 'application/json',
      }
    end

    subject { delete url, params: params.to_json, headers: headers }

    context 'Delete a todo' do
      before do
        todos_arr = []
        5.times do
          todo = build(:todo)
          todos_arr << todo
        end
        ::Todo.import!(todos_arr)
      end

      let(:todo_id) { ::Todo.all.first.id }
      let(:params) do
        {
          id: todo_id,
        }
      end

      it 'return correct todo size' do
        subject
        # binding.irb
        expect(::Todo.all.count).to eq 4
      end
    end
  end
end
