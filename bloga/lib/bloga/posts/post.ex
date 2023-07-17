defmodule Bloga.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bloga.Comments.Comment

  schema "posts" do
    field :title, :string
    field :body, :string
    has_many :comments, Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
