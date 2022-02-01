NAMESPACE Simatic.Ax.Collections
    INTERFACE ILifo
        
        METHOD Push : IListItem
            VAR_INPUT
                item : IListItem;
            END_VAR
        END_METHOD
        
        METHOD Pop : IListItem
        END_METHOD
        
        METHOD Top : IListItem
        END_METHOD

        METHOD Count : INT 
        END_METHOD
    
    END_INTERFACE    
END_NAMESPACE