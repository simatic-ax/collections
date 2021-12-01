USING AxUnit.Assert;
USING Siemens.Ax.Collections;
USING AxUnit.Assert;

NAMESPACE Siemens.Ax.Collections
    {TestFixture}
    CLASS TestList
        VAR PRIVATE
            _list : LinkedList;                    
            _i1 : ListItem;
            _i2 : ListItem;
            _i3 : ListItem;
            _ifake : ListItem;
            _iReturn : IListItem;
            _item : IListItem;
        END_VAR
        


        {Test}
        METHOD PUBLIC Test_Add_Expect_Item
            _item := _i1;
            _iReturn := _list.Add(item := _i1);
            Equal(_iReturn = _item, TRUE);
            Equal(_list.Count(), 1);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Test_Add_3_Elements
            _iReturn := _list.Add(item := _i1);
            _iReturn := _list.Add(item := _i2);
            _iReturn := _list.Add(item := _i3);

            _item := _i3; // Tail
            Equal(_list.Head() = _item, TRUE);

            _item := _i1; // Tail
            Equal(_list.Tail() = _item, TRUE);
            
            Equal(_list.Count(), 3);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Test_Tail_Top_NULL
            THIS.Test_Add_3_Elements();
            Equal(_list.Tail().PreviousItem() = NULL, TRUE);
            Equal(_list.Head().NextItem() = NULL, TRUE);
        END_METHOD
        {Test}

        METHOD PUBLIC Test_Tail_Next_Equals_Top
            _list.Add(item := _i1);
            _list.Add(item := _i2);
            _list.Add(item := _i3, join := TRUE);
        
            _item := _i1;
            Equal(_list.Head().NextItem() = _item, TRUE);

            _item := _i3;
            Equal(_list.Tail().PreviousItem() = _item, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_RemoveItem_i2_and_expect_i1_i3_linked
            THIS.Test_Add_3_Elements();
        
            _list.Remove(_i2);
            _item := _i1;
            Equal(_list.Head().PreviousItem() = _item, TRUE);
            _item := _i3;
            Equal(_list.Tail().NextItem() = _item, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_RemoveItem_tail_and_expect_i2_tail
            VAR_TEMP
                result : BOOL;
            END_VAR
            THIS.Test_Add_3_Elements();
        
            result := _list.Remove(_list.Tail());
            _item := _i2;
            Equal(result, TRUE);
            Equal(_list.Tail() = _item, TRUE);
            Equal(_list.Tail().PreviousItem() = NULL, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_RemoveItem_head_and_expect_i2_head
            VAR_TEMP
                result : BOOL;
            END_VAR

            THIS.Test_Add_3_Elements();
        
            result := _list.Remove(_list.Head());
            _item := _i2;
            Equal(result, TRUE);
            Equal(_list.Head() = _item, TRUE);
            Equal(_list.Head().NextItem() = NULL, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_RemoveAllItems_and_Expect_tail_and_head_null
            VAR_TEMP
                result : BOOL;
            END_VAR
            THIS.Test_Add_3_Elements();
        
            _list.Remove(_list.Head());
            _list.Remove(_list.Head());
            result := _list.Remove(_list.Head());
            
            Equal(result, TRUE);
            Equal(_list.Head() = NULL, TRUE);
            Equal(_list.Tail() = NULL, TRUE);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Remove_From_Empty_List_and_expect_false
            Equal(_list.Remove(_i1), FALSE);
        END_METHOD

        {Test}
        METHOD PUBLIC Remove_NotExisting_item_from_list_and_expect_false
            THIS.Test_Add_3_Elements();
            Equal(_list.Remove(_ifake), FALSE);
        END_METHOD
    END_CLASS
END_NAMESPACE 
