NAMESPACE Simatic.Ax.Collections
    INTERFACE IFifo
        METHOD Enqueue : IListItem
            VAR_INPUT
                item : IListItem;
            END_VAR
        END_METHOD
        
        METHOD Dequeue : IListItem
        END_METHOD

        METHOD Count : INT 
        END_METHOD

    END_INTERFACE    
END_NAMESPACE