defmodule Cardsgame do
  @moduledoc """
  Documentation for `Cardsgame`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cardsgame.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load_back(filename) do

    case File.read(filename) do
      {:ok, fbinary} -> :erlang.binary_to_term fbinary
      {:error, _reason} -> "This File does not exist"
    end
  end

    def create_hand(hand_size) do
      #using the a pipe operator to call other functions
      Cardsgame.create_deck
      |>Cardsgame.shuffle
      |>Cardsgame.deal(hand_size)
    end

end
