USING AxUnit.Assert;
USING Simatic.Ax.Collections;
USING AxUnit.Assert;

NAMESPACE Simatic.Ax.Collections
    {TestFixture}
    CLASS TestStack
        VAR PRIVATE
            _stack : Stack;                    
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
            _iReturn := _stack.Push(item := _i1);
            Equal(_iReturn = _item, TRUE);
            Equal(_stack.Count(), 1);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Test_Add_3_Elements
            _iReturn := _stack.Push(item := _i1);
            _iReturn := _stack.Push(item := _i2);
            _iReturn := _stack.Push(item := _i3);

            _item := _i3;
            Equal(_stack.Top() = _item, TRUE);
            Equal(_stack.Count(), 3);
        END_METHOD
        
        {Test}
        METHOD PUBLIC Test_Tail_Top_NULL
            THIS.Test_Add_3_Elements();
            Equal(_stack.Top().NextItem() = NULL, TRUE);
        END_METHOD
        

        {Test}
        METHOD PUBLIC Test_PopItem_and_expect_i3_and_i2_on_top
            THIS.Test_Add_3_Elements();
        
            _item := _i3;
            Equal(_stack.Pop() = _item, TRUE);
            _item := _i2;
            Equal(_stack.Top() = _item, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_Pop_2_Items_and_expect_i2_and_i1_on_top

            THIS.Test_Add_3_Elements();
        
            _item := _i2;
            _stack.Pop();
            Equal(_stack.Pop() = _item, TRUE);
            
            _item := _i1;
            Equal(_stack.Top() = _item, TRUE);
        END_METHOD

        {Test}
        METHOD PUBLIC Test_Pop_from_empty_List
            Equal(_stack.Pop() = NULL, TRUE);            
        END_METHOD

    END_CLASS
END_NAMESPACE 
