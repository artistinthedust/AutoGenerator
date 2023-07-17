defmodule Bloga.CommentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bloga.Comments` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        name: "some name",
        content: "some content"
      })
      |> Bloga.Comments.create_comment()

    comment
  end
end
