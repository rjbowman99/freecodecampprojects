#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


MAIN_MENU () {
  echo -e "\n~~~ Welcome to Robby's Nail Salon ~~~\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")  
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  echo -e "\nPlease make a service selection:"

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) BOOK_APPOINTMENT 1 ;;
    2) BOOK_APPOINTMENT 2 ;;
    3) BOOK_APPOINTMENT 3 ;;
    *) echo -e "\nPlease enter a valid option."; MAIN_MENU ;;
  esac

}

BOOK_APPOINTMENT () {
  
  # Get Customer Info
  echo -e "\nPlease enter your phone number:"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
  echo -e "\nPlease enter your name:"
  read CUSTOMER_NAME
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  #BOOK APPOINTMENT
  SERVICE_ID_SELECTED=$1
  echo -e "\nPlease enter a time:"
  read SERVICE_TIME
  INSERTED_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  #CONFIRMATION
  # change service_id to service
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU