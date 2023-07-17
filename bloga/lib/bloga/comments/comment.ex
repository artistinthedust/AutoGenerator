defmodule Bloga.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bloga.Posts.Post

  schema "comments" do
    field :name, :string
    field :content, :string
    belongs_to(:post, Post)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
