package com.example.lab_08_java.services;

import com.example.lab_08_java.data.*;
import com.example.lab_08_java.data.dtos.PizzaDTO;
import com.example.lab_08_java.data.dtos.StepDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ClientServices {
    private final PizzaServices pizzaServices;
    private final Restaurant restaurant;
    private static int orderNumber = 1;


    public Client createNewClient(List<PizzaDTO> orderPizzas) {
        Order order = new Order(
                orderNumber, orderPizzas,
                orderPizzas
                        .stream()
                        .map(PizzaDTO::getPrice)
                        .reduce(0, Integer::sum),
                false
        );
        order.setCreatedOrderTime(LocalTime.now());
        Client c = new Client(UUID.randomUUID().getLeastSignificantBits(), "Client " + orderNumber++, order, -1);
        order.setClientName(c.getName());
        restaurant.getClients().add(c);
        return c;
    }

    public List<PizzaDTO> randomOrder() {
        List<PizzaDTO> all = pizzaServices.getPizzaList();
        Random random = new Random();
        int pizzaAmount = random.nextInt(1, 5);
        return randomOrder(all, random, pizzaAmount);
    }

    public List<PizzaDTO> randomOrderWithGift() {

        List<PizzaDTO> all = pizzaServices.getPizzaList();
        Random random = new Random();
        int pizzaAmount = random.nextInt(1, 9);

        List<PizzaDTO> resultList = randomOrder(all, random, pizzaAmount);
        int pizzaSale = pizzaAmount/4;
        for(int i = 0; i < pizzaSale; i++){
            resultList.add(randomedGiftPizza(all));
        }
        return resultList;
    }

    private List<PizzaDTO> randomOrder(List<PizzaDTO> all, Random random, int pizzaAmount) {
        List<PizzaDTO> resultList = new ArrayList<>();
        for (int i = 0; i < pizzaAmount; i++) {
            int randomNumber = random.nextInt(all.size());
            PizzaDTO pizza = all.get(randomNumber);
            List<StepDTO> steps = new ArrayList<>();
            pizza.getNeedSteps().forEach(step -> steps.add(new StepDTO(step.getName(), step.isIfMade())));
            resultList.add(new PizzaDTO(pizza.getId(), pizza.getCreationTime(), steps, pizza.getName(), pizza.getPrice()));
        }
        return resultList;
    }

    private PizzaDTO randomedGiftPizza(List<PizzaDTO> all) {
        Random random = new Random();
        int randomNumber = random.nextInt(all.size());
        PizzaDTO pizza = all.get(randomNumber);
        List<StepDTO> steps = new ArrayList<>();
        pizza.getNeedSteps().forEach(step -> steps.add(new StepDTO(step.getName(), step.isIfMade())));
        return new PizzaDTO(pizza.getId(), pizza.getCreationTime(), steps, pizza.getName(), 0);
    }
}
