defprotocol DeltaCrdt.JoinSemilattice do
  @fallback_to_any true

  @moduledoc """
  A join-semilattice is a set with a partial order and a binary join operation that returns the least upper bound (LUB) of two elements. A join is designed to be commutative, associative, and idempotent.
  """

  @doc "joins two states s1 and s2"
  def join(s1, s2)
end

defimpl DeltaCrdt.JoinSemilattice, for: Any do
  def join(s1, s2) do
    new_crdt = DeltaCrdt.JoinSemilattice.join(s1.crdt, s2.crdt)
    %{s1 | crdt: new_crdt}
  end
end
