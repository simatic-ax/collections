NAMESPACE Simatic.Ax.Collections
    CLASS Fifo IMPLEMENTS IFifo
        VAR PRIVATE
            _list : LinkedList;
        END_VAR

        METHOD PUBLIC FINAL Enqueue : IListItem
            VAR_INPUT
                item : IListItem;
            END_VAR

            Enqueue := _list.Add(item := item);
        END_METHOD
        
        METHOD PUBLIC Dequeue : IListItem
            Dequeue := _list.Tail();
            _list.Remove(_list.Tail());
        END_METHOD
    
        METHOD PUBLIC Count : INT
            Count := _list.Count();
        END_METHOD
END_CLASS

END_NAMESPACE