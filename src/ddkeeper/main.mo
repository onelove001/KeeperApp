import List "mo:base/List";
import Debug "mo:base/Debug";

actor dKeeper {

  type Note = {
    title: Text;
    content: Text;
  }; 

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(postTitle:Text, postContent:Text) {

    let newNote: Note = {
      title = postTitle;
      content = postContent;
    };

  notes := List.push(newNote, notes);

  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(index: Nat) {
    let listFront = List.take(notes, index);
    let listBack = List.drop(notes, index + 1);
    notes := List.append(listFront, listBack);
  };
  
};
