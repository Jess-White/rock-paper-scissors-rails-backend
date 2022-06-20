require "rails_helper"

describe Api::PlayersController do
  player_fields = %w(
    id created_at updated_at player_name wins
  )

before(:example) {
    @eleanor = Player.create!({
        player_name: "eleanor",
        wins: 0,
    })
    @jason = Player.create!({
        player_name: "jason",
        wins: 0,
    })
  }

#players index
  describe "GET /players" do
    it "renders 200 with players" do
      get :index
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to match([
        a_hash_including(
          "created_at" => kind_of(String),
          "id" => kind_of(Integer),
          "player_name" => @eleanor.player_name,
          "updated_at" => kind_of(String),
          "wins" => @eleanor.wins,
        ),
        a_hash_including(
          "created_at" => kind_of(String),
          "id" => kind_of(Integer),
          "player_name" => @jason.player_name,
          "updated_at" => kind_of(String),
          "wins" => @jason.wins,
        ),
      ])
    end
  end

  #players show
  describe "GET /players/:player_id" do

    it "renders 401 if player does not exist" do
      get :show, params: {
        id: "123456789",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with player" do
      get :show, params: {
        id: @jason.id,
      }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*player_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "created_at" => kind_of(String),
          "id" => kind_of(Integer),
          "player_name" => @jason.player_name,
          "updated_at" => kind_of(String),
          "wins" => @jason.wins,
        ),
      )
    end
  end

# players create
  describe "POST /players" do
    it "renders 422 when given invalid params" do
      post :create, params: {
        player_name: ""
      }

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "errors" => [
            "Player name can't be blank",
          ],
        ),
      )
    end

    it "renders 201 with created player" do
      post :create, params: {
        player_name: "kevin_the_demon",
        wins: 0
      }

      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body).keys).to contain_exactly(*player_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => kind_of(Integer),
          "player_name" => "kevin_the_demon",
          "wins" => kind_of(Integer)
        )
      )
    end
  end

  #players update
  describe "PATCH /players/:id" do
    let(:player) {
      Player.create!({
        player_name: "chidi_anaconda",
        wins: 1,
      })
    }
    let(:update_params) {
      {
        id: player.id,
        player_name: "chidi_anagonye",
        wins: 2,
      }
    }

    it "renders 401 if player does not exist" do
      patch :update, params: { **update_params, id: "123" }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with updated fields" do
      patch :update, params: update_params

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*player_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "created_at" => kind_of(String),
          "id" => player.id,
          "player_name" => update_params[:player_name],
          "updated_at" => kind_of(String),
          "wins" => update_params[:wins],
        )
      )
    end
  end

#players delete
  describe "DELETE /players/:player_id" do

    it "renders 401 if player does not exist" do
      delete :destroy, params: { id: "123456789" }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with deleted player" do
      player = @jason

      delete :destroy, params: { id: player.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "created_at" => player.created_at.iso8601(3),
          "id" => player.id,
          "player_name" => player.player_name,
          "updated_at" => player.updated_at.iso8601(3),
          "wins" => player.wins,
        ),
      )
    end
  end
end
