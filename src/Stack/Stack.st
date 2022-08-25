NAMESPACE Simatic.Ax.Collections
    CLASS FINAL Stack IMPLEMENTS ICollection
        VAR PRIVATE
            _list : LinkedList;
        END_VAR

        METHOD PUBLIC FINAL Push : IListItem
            VAR_INPUT
                item : IListItem;
            END_VAR

            Push := _list.Add(item := item);
        END_METHOD
        
        METHOD PUBLIC Pop : IListItem
            Pop := _list.Head();
            _list.Remove(_list.Head());
        END_METHOD
    
        METHOD PUBLIC Count : INT
            Count := _list.Count();
        END_METHOD

        METHOD PUBLIC Peek : IListItem
            Peek := _list.Head();
        END_METHOD
END_CLASS

END_NAMESPACE