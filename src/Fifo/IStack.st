NAMESPACE Siemens.Ax.Collections
    INTERFACE IFifo
        METHOD Write
            VAR_INPUT
                item : IListItem;
            END_VAR
        END_METHOD
        METHOD Read : IListItem
        END_METHOD
        METHOD Count : INT END_METHOD
    END_INTERFACE    
END_NAMESPACE