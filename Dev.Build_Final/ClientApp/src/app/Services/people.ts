import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { people } from "../interfaces/Ipeople";
import { Observable } from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class peopleService {
  constructor(private http: HttpClient) { }


  peopleUrl = '/api/people'

  getPeopleList() {
    return this.http.get(`${this.peopleUrl}`);
  }

  AddPerson(newPerson: people): Observable<people> {
    const headers = { 'content-type': 'application/json' };
    const body = JSON.stringify(newPerson);
    var newURL = this.peopleUrl + '/add'
    console.log(body)
    return this.http.post<people>(newURL, body, { 'headers': headers });
  }

  removePerson(removePerson: people) {
    var newURL = this.peopleUrl + `/remove/${removePerson.id}`
    return this.http.delete<people>(newURL).subscribe((data) => console.log(data));;
  }
}
