module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :query1, ElevatorType, null: false do
      description "get a list of elevators"
      argument :id, ID, required: true
    end
    def query1 (id:)
      Elevator.find(id)
     
    end
    field :query2, Query2Type, null: false do
      description "get a list of elevators"
      argument :id, ID, required: true
    end
    def query2 (id:)
      elevator = Elevator.find(id)
      iD = id.to_i
      nextelevator = Elevator.find(iD+1)
      elevatorHash = elevator.attributes
      elevatorHash["next_elevator"] = nextelevator
      result = {
        lift: elevatorHash
      }
     
    end

    field :query3, Query3Type, null: false do
      description "get a list of interventions"
      argument :id, ID, required: true
    end
    def query3 (id:)
      intervention = Factintervention.find(id)
      interventionHash = intervention.attributes
      # iD = id.to_i
      # nextelevator = Elevator.find(iD+1)
      # elevatorHash = elevator.attributes
      # elevatorHash["next_elevator"] = nextelevator
      result = {
        intervention: interventionHash
      }     
    end


  end
end
