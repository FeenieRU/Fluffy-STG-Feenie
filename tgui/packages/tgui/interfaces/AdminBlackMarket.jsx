import { useBackend } from '../backend';
import { Button, Input, NoticeBox, NumberInput, Stack } from '../components';
import { Window } from '../layouts';
/*
type Data = {
  item_dir: string;
  item_name: string;
  item_description: string;
  item_price: number;
  item_count: number;
  error: string;
};
*/
export const AdminBlackMarket = (props) => {
  const { act, data } = useBackend();
  const {
    item_dir,
    item_name,
    item_description,
    item_price,
    item_count,
    error,
  } = data;

  return (
    <Window width={300} height={380} theme="hackerman">
      <Window.Content>
        {!!error && (
          <NoticeBox textAlign="center" color="red">
            {error}
          </NoticeBox>
        )}
        <Stack vertical fill>
          <Stack.Item>
            <Input
              width="80%"
              value={item_dir}
              placeholder="Dir of item"
              onChange={(e, value) =>
                act('change_dir', {
                  value: value,
                })
              }
            />
            <Input
              width="80%"
              value={item_name}
              placeholder="Name of position"
              onChange={(e, value) =>
                act('change_name', {
                  value: value,
                })
              }
            />
            <Input
              width="80%"
              value={item_description}
              placeholder="Description of position"
              onChange={(e, value) =>
                act('change_description', {
                  value: value,
                })
              }
            />
            <NumberInput
              step={1}
              width="20%"
              value={item_price}
              minValue={1}
              maxValue={500000}
              unit="cr"
              onChange={(value) =>
                act('change_price', {
                  value: value,
                })
              }
            />
            <NumberInput
              step={1}
              width="20%"
              value={item_count}
              minValue={1}
              maxValue={10000}
              unit="amount"
              onChange={(value) =>
                act('change_count', {
                  value: value,
                })
              }
            />
          </Stack.Item>
          <Stack.Divider />
          <Stack.Item>
            <Button.Confirm
              fluid
              icon="truck-arrow-right"
              content="Place on Market"
              onClick={() => act('place_on_market')}
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
